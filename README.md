# FlowLine Prototype

A Streamlit app that integrates Firebase and displays an interactive map centered on San Francisco.

## Features

- 🔥 Firebase integration with Firestore
- 🗺️ Interactive map using Folium (OpenStreetMap tiles)
- 📍 Default location: San Francisco (37.7749, -122.4194)

## How to run it on your own machine

1. Install the requirements

   ```bash
   pip install -r requirements.txt
   ```

2. (Optional) Set up Firebase credentials

   To enable Firebase functionality, you need to set up authentication:
   
   - **Option 1**: Use Application Default Credentials
     ```bash
     export GOOGLE_APPLICATION_CREDENTIALS="path/to/your/serviceAccountKey.json"
     ```
   
   - **Option 2**: The app will run in demo mode without credentials
   
   Note: To get a service account key:
   - Go to Firebase Console → Project Settings → Service Accounts
   - Click "Generate New Private Key"
   - Save the JSON file and reference it in the environment variable

3. Run the app

   ```bash
   streamlit run streamlit_app.py
   ```

## Project Structure

- `streamlit_app.py` - Main application file with Firebase initialization and map display
- `requirements.txt` - Python dependencies
- `README.md` - This file

## Dependencies

- `streamlit` - Web application framework
- `firebase-admin` - Firebase Admin SDK for Python
- `folium` - Interactive maps library
- `streamlit-folium` - Streamlit component for Folium maps
