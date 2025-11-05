import streamlit as st
import folium
from streamlit_folium import st_folium

# Page configuration
st.set_page_config(
    page_title="FlowLine Prototype",
    page_icon="🗺️",
    layout="wide"
)

# App title
st.title("FlowLine Prototype")

# Create a map centered on San Francisco (matching Flutter app coordinates)
m = folium.Map(
    location=[37.7749, -122.4194],
    zoom_start=13,
    tiles="OpenStreetMap",
    attr="© OpenStreetMap contributors"
)

# Display the map
st_folium(m, width=None, height=600, returned_objects=[])

# Optional: Add Firebase/Firestore integration section
st.sidebar.header("Configuration")
st.sidebar.info("Firebase/Firestore integration can be added here")

# Footer
st.caption("© OpenStreetMap contributors")
