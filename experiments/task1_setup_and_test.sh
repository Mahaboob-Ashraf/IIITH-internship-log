# --- Step 1: Create Virtual Environment ---
# Creating a new environment named 'venv'
python -m venv venv

.\venv\Scripts\activate

# --- Step 2: Install Ultralytics ---
pip install ultralytics

# --- Step 3: Sanity Check (Detection) ---
# Testing with the default 'bus.jpg' to verify installation
# This downloads 'yolov8n.pt' automatically
yolo task=detect mode=predict model=yolov8n.pt source='https://ultralytics.com/images/bus.jpg' show=True

# --- Step 4: Sanity Check (Segmentation) ---
# Testing segmentation as requested
yolo task=segment mode=predict model=yolov8n-seg.pt source='https://ultralytics.com/images/bus.jpg' show=True
