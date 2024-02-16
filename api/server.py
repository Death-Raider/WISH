"""
- Uses core files to create higher level functions for processing which include:
* Obtaining information using OCR and update user profile
* Giving proper inputs for research papers and maintaining fixed results 
* Filter chats for explict content and words

- Handles the database queries which include:
* storing and retreving user profile details in the format (./data/user_data_template.json)
* store and retreving text message for chatrooms
"""

#connect to database
import firebase_admin
from firebase_admin import credentials
from firebase_admin import auth
from firebase_admin import firestore
from models import Post

cred = credentials.Certificate('wish-9c75f-firebase-adminsdk-mq06b-11c16e74b7.json')
default_app = firebase_admin.initialize_app(cred)


def get_user(uid: str):
    try:
        user = auth.get_user(uid)
        return user
    except Exception as e:
        return str(e)
    
def create_post(uid: str, post: Post):
    try:
        db = firestore.client()
        doc_ref = db.collection('posts').document()
        doc_ref.set(post)
        return doc_ref.id
    except Exception as e:
        return str(e)
    