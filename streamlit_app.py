import streamlit as st
import folium
from streamlit_folium import st_folium
import firebase_admin
from firebase_admin import credentials, firestore

# Initialize Firebase
@st.cache_resource
def initialize_firebase():
    """Initialize Firebase app if not already initialized."""
    if not firebase_admin._apps:
        try:
            # For local development, you can use application default credentials
            # or specify a service account key file
            cred = credentials.ApplicationDefault()
            firebase_admin.initialize_app(cred)
        except Exception as e:
            # If application default credentials are not available,
            # initialize without credentials (for demo purposes)
            st.warning(f"Firebase initialization: {str(e)}")
            st.info("Running in demo mode without Firebase credentials")
            return None
    return firestore.client() if firebase_admin._apps else None

# Initialize Firebase
db = initialize_firebase()

# App UI
st.title("FlowLine Prototype")

# Create map centered on San Francisco
st.subheader("Map View")

# Create a folium map centered at San Francisco coordinates
# Latitude: 37.7749, Longitude: -122.4194, Zoom: 13
m = folium.Map(
    location=[37.7749, -122.4194],
    zoom_start=13,
    tiles='OpenStreetMap'
)

# Display the map
st_folium(m, width=700, height=500)

# Display Firebase connection status
if db:
    st.success("✅ Firebase connected successfully")
else:
    st.info("ℹ️ Running without Firebase connection")
