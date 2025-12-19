# --- Part 1: Inference on Multiple Images ---
# Running prediction on a folder of images
yolo task=detect mode=predict model=yolov8n.pt source='./data/images_folder' save=True

# --- Part 2: Generating Metrics (The "Training" Step) ---
# To get the metrics mentioned in the message (Precision, Recall, mAP),
# we must train on a small standard dataset (COCO128) for a few epochs.
yolo task=detect mode=train model=yolov8n.pt data=coco128.yaml epochs=5 imgsz=640

# --- Explanation of Outputs ---
# The metrics mentioned in the prompt will be generated at:
# runs/detect/train/results.csv  <-- The raw metrics
# runs/detect/train/confusion_matrix.png
# runs/detect/train/F1_curve.png
