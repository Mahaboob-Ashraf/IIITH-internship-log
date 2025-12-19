# --- Step 1: Extract Frames using FFMPEG ---
# Splits 'input_video.mp4' into individual images inside 'raw_frames' folder
mkdir raw_frames
ffmpeg -i input_video.mp4 -vf fps=30 raw_frames/frame_%04d.jpg

# --- Step 2: Process Frames with YOLO ---
# Run object detection on the folder of extracted frames
# Results will be saved in 'runs/detect/predict_frames'
yolo task=detect mode=predict model=yolov8n.pt source='raw_frames' save=True project='runs/detect' name='processed_frames'

# --- Step 3: Stitch Frames back to Video ---
# Combines the processed images back into a video file
ffmpeg -framerate 30 -i runs/detect/processed_frames/frame_%04d.jpg -c:v libx264 -pix_fmt yuv420p output_video.mp4
