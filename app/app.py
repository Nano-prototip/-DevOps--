from flask import Flask, render_template, request, jsonify
import os
from datetime import datetime

app = Flask(__name__)

# Главная страница
@app.route('/')
def index():
    return render_template('index.html')

# API endpoint для получения времени
@app.route('/api/time')
def get_time():
    return jsonify({
        'time': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
        'timezone': 'UTC'
    })

# API endpoint для эхо сообщений
@app.route('/api/echo', methods=['POST'])
def echo():
    data = request.get_json()
    message = data.get('message', '')
    return jsonify({
        'echo': message,
        'timestamp': datetime.now().isoformat()
    })

# Health check endpoint
@app.route('/health')
def health():
    return jsonify({'status': 'healthy', 'service': 'web-app'})

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port, debug=False)