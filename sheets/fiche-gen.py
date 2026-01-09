import os
import json
import time
import requests
from jinja2 import Environment, FileSystemLoader

# Configuration
GOTENBERG_URL = "http://gotenberg:3000/forms/chromium/convert/html"
FONT_PATH = "assets/handwriting.ttf"
OUTPUT_DIR = "output"

def download_font_if_needed():
    """Télécharge la police si absente"""
    font_url = "https://github.com/google/fonts/raw/main/ofl/patrickhand/PatrickHand-Regular.ttf"
    if not os.path.exists(FONT_PATH):
        print(f"Téléchargement de la police...")
        try:
            r = requests.get(font_url)
            with open(FONT_PATH, 'wb') as f:
                f.write(r.content)
            print("Téléchargement terminé.")
        except Exception as e:
            print(f"⚠️ Erreur téléchargement police : {e}")

def extract_background():
    """Extrait la première page du PDF original comme image de fond"""
    input_pdf = "Fiche-TftL.pdf"
    output_bg = "assets/background.png"
    
    if not os.path.exists(input_pdf):
        print(f"⚠️ Fichier source {input_pdf} manquant pour le fond.")
        return

    try:
        import fitz
        doc = fitz.open(input_pdf)
        page = doc[0]
        pix = page.get_pixmap(dpi=150) # 150 DPI suffit pour l'écran/print basique
        pix.save(output_bg)
        print(f"Fond extrait : {output_bg}")
    except Exception as e:
        print(f"⚠️ Erreur extraction fond : {e}")

def create_character_sheets():
    # Données (inchangées)
    # Load characters from JSON
    with open('characters.json', 'r', encoding='utf-8') as f:
        characters = json.load(f)

    # Create output directory
    if not os.path.exists(OUTPUT_DIR):
        os.makedirs(OUTPUT_DIR)

    download_font_if_needed()
    # extract_background() # No longer needed
    
    # Configuration Jinja2
    env = Environment(loader=FileSystemLoader("templates"))
    template = env.get_template("index.html")

    print(f"Attente du service Gotenberg ({GOTENBERG_URL})...")
    # Simple wait Loop
    for i in range(10):
        try:
            requests.get("http://gotenberg:3000/health", timeout=2)
            print("Gotenberg est prêt !")
            break
        except:
            print(f"En attente... ({i+1}/10)")
            time.sleep(2)

    for char in characters:
        print(f"Génération pour {char['data']['NOM :']}...")
        
        # Prepare render data (copy to avoid modifying original info directly if needed)
        render_data = char['data'].copy()
        
        # Prepare files dict
        files = {
            'handwriting.ttf': ('handwriting.ttf', open(FONT_PATH, 'rb')),
            'logo.png': ('logo.png', open('assets/tftl-logo.png', 'rb')),
            'texture.png': ('texture.png', open('assets/texture.png', 'rb'))
        }

        # Handle Photo
        if 'PHOTO' in char['data'] and char['data']['PHOTO']:
            photo_path = char['data']['PHOTO']
            # Check if path starts with data/ and adjust it to ../data/
            # if photo_path.startswith('data/'):
            #      photo_path = os.path.join('..', photo_path)

            if os.path.exists(photo_path):
                photo_basename = os.path.basename(photo_path)
                files[photo_basename] = (photo_basename, open(photo_path, 'rb'))
                # Update data for template to use just the filename
                render_data['PHOTO'] = photo_basename
            else:
                print(f"⚠️ Photo manquante: {photo_path}")
                render_data['PHOTO'] = None

        # Rendu HTML with updated data
        html_content = template.render(data=render_data)
        files['index.html'] = ('index.html', html_content)
        
        try:
            # Paramètres pour Gotenberg : On fait confiance au CSS (@page)
            data = {
                'preferCssPageSize': 'true',
                'printBackground': 'true',
                'marginTop': '0',
                'marginBottom': '0',
                'marginLeft': '0',
                'marginRight': '0'
            }
            
            resp = requests.post(GOTENBERG_URL, files=files, data=data, timeout=30)
            
            if resp.status_code == 200:
                out_name = os.path.join(OUTPUT_DIR, char["filename"])
                with open(out_name, 'wb') as f:
                    f.write(resp.content)
                print(f"✅ Généré : {out_name}")
            else:
                print(f"❌ Erreur Gotenberg pour {char['filename']}: {resp.status_code} - {resp.text}")
        except Exception as e:
            print(f"❌ Exception lors de la requête Gotenberg : {e}")

if __name__ == "__main__":
    create_character_sheets()