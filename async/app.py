from flask import Flask, render_template, request, jsonify

# Create Flask app instance
app = Flask(__name__)

# Home route
@app.route("/")
def home():
    return "Hello, Flask! This is your app running."

@app.route("/search_refresh")
def search_refresh():
    return render_template('search_refresh.html')

@app.route("/results_refresh")
def results_refresh():
    return render_template('results_refresh.html')

@app.route("/search_feedback")
def search_feedback():
    return render_template('search_feedback.html')

@app.route("/results_feedback")
def results_feedback():
    return render_template('results_feedback.html')


# Example API route
@app.route("/api/greet", methods=["GET"])
def greet():
    name = request.args.get("name", "World")
    return jsonify({"message": f"Hello, {name}!"})

# Example POST route
@app.route("/api/echo", methods=["POST"])
def echo():
    data = request.get_json()
    return jsonify({"you_sent": data})

# Run the app
if __name__ == "__main__":
    app.run(debug=True)
