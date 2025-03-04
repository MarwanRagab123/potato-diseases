# Potato Disease Classification using CNN & GCP API

## Overview
This project is a **deep learning-based classification system** for detecting potato diseases using a **Convolutional Neural Network (CNN)**. The model classifies potato leaves into three categories:

- **Early Blight**
- **Late Blight**
- **Healthy**

The trained model is deployed as an **API**, hosted on **Google Cloud Platform (GCP)**, and integrated with a **Flutter** mobile application.

---

## Project Structure
```bash
📂 POTATO-DISEASES
├── 📂 api                # Backend API for model inference
│   ├── main.py           # Main API script
│   ├── main_tf.py        # TensorFlow model handler
│   ├── requirements.txt  # API dependencies
├── 📂 flutterapp         # Flutter mobile application
│   ├── potatos_diseases  # App source code
│   ├── potatos_diseases.rar # Compressed project files
├── 📂 gcp                # GCP deployment files
│   ├── main.py           # GCP API script
│   ├── requirements.txt  # GCP dependencies
├── 📂 save_models        # Trained models
│   ├── 1.keras
│   ├── 2.keras
│   ├── potatos.h5
├── 📂 training           # Model training scripts
│   ├── training.ipynb    # Jupyter Notebook for training
│   ├── .ipynb_checkpoints
└── 📜 README.md          # Project documentation

---

## Tech Stack
- **Deep Learning**: TensorFlow / Keras
- **Backend API**: Flask / FastAPI
- **Cloud Deployment**: Google Cloud Platform (Cloud Run / Cloud Functions)
- **Mobile App**: Flutter
- **Dataset**: PlantVillage (Publicly Available)

---

## Screenshots

### **Model Training Progress**
![Training&val](https://github.com/user-attachments/assets/826c0275-7512-432e-92f1-d4d5e00878e7)

### **Flutter App Interface**
![Flutter App](https://github.com/user-attachments/assets/db0d6f3b-56f6-4967-b78f-1bf17552680e)


### **API in Action**
![Postmasn Api](https://github.com/user-attachments/assets/a4e8d03a-9d98-40fe-9010-ebd01a93a366)


---

## Author
**Marwan Ragab**   


