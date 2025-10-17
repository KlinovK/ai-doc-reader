# DOCREADER

A lightweight iOS app for effortless document scanning and management. Built with SwiftUI's MVP architecture for clean, reactive UI, and powered by Apple's VisionKit framework for high-quality document capture. Scanned documents are securely stored in a local SwiftData database, allowing users to preview them as images or delete as needed.

Key Features:

- Document Scanning: Capture and auto-detect document edges using the device's camera via VisionKit's VNDocumentCameraViewController for seamless, high-quality scans.
- Secure Storage: Persist scanned documents directly in a local SwiftData database for fast, offline access and efficient data management.
- Image Preview: View full-resolution previews of saved documents as interactive images for quick review.
- Easy Management: Delete individual documents with a simple tap, keeping your library organized.

## Architecture

CryptoTracker follows the **MVP** (Model-View-Presenter) pattern and is organized into clean, modular layers:

### Layered Structure:

- ** Presentation Layer**  
  Handles UI rendering, user interactions, and business logic.

- ** Model Layer**  
  Contains data models, parsing logic (Decodable), and domain representations.

- ** Application Layer**  
  Handles:
  - App entry point (`AppDelegate`, `SceneDelegate`)

## Getting Started

### Prerequisites

- Xcode 16+
- iOS 16.0+
- Swift 5.9+
