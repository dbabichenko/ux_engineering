from flask import Flask, render_template, request, jsonify
import time

# Create Flask app instance
app = Flask(__name__)

# Home route
@app.route("/")
def home():
    return "Hello, Flask! This is your app running."

@app.route("/search_refresh")
def search_refresh():
    return render_template('search_refresh.html')

@app.route("/search_sync")
def search_sync():
    return render_template('search_sync.html')

@app.route("/search_async")
def search_async():
    return render_template('search_async.html')

@app.route("/results_refresh")
def results_refresh():
    return render_template('results_refresh.html')

@app.route("/search_feedback")
def search_feedback():
    return render_template('search_feedback.html')

@app.route("/results_feedback")
def results_feedback():
    return render_template('results_feedback.html')


@app.route("/get_data", methods=["GET"])
def get_data():
    f = open('data/books.txt')
    data = f.readlines()
    f.close()
    time.sleep(10)  # delay for 10 seconds
    return jsonify(data)


# Run the app
if __name__ == "__main__":
    app.run(debug=True)
