deps:
		pip install -r requirements.txt;\
		pip install -r test_requirements.txt
lint:
		flake8 hello_world test
test:
		class TestFormater(unittest.TestCase):
				  def test_plain_lowercase(self):
				      r = plain_text_upper_case("WWIMIE", "EEEMSG")
				      name = r.split(" ")[0]
				      msg = r.split(" ")[1]
				      self.assertTrue(name.isupper())
				      self.assertTrue(msg.isupper())
run:
		from hello_world import app
		from formater import get_formatted
		from formater import SUPPORTED, PLAIN
		from flask import request

		moje_imie = "Bernadeta"
		msg = "Hello World!"

		@app.route('/')
		def index():
				output = request.args.get('output')
				if not output:
						output = PLAIN
				return get_formatted(msg, moje_imie,
														 output.lower())

		@app.route('/outputs')
		def supported_output():
				return ", ".join(SUPPORTED)
