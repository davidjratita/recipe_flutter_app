importScripts(
  "https://www.gstatic.com/firebasejs/9.6.11/firebase-app-compat.js"
);
importScripts(
  "https://www.gstatic.com/firebasejs/9.6.11/firebase-messaging-compat.js"
);

const firebaseConfig = {
  apiKey: "AIzaSyCKBZ2ZcEAT4M-gL-HZgHgYTnXo43XnVlM",
  authDomain: "butterfly-studios.firebaseapp.com",
  projectId: "butterfly-studios",
  storageBucket: "butterfly-studios.firebasestorage.app",
  messagingSenderId: "1048278967155",
  appId: "1:1048278967155:web:3726e7f82f04f321919b06",
  measurementId: "G-42HYS6QQ20",
};

// ✅ Initialize Firebase before using messaging
firebase.initializeApp(firebaseConfig);

// ✅ Retrieve Messaging instance
const messaging = firebase.messaging();
