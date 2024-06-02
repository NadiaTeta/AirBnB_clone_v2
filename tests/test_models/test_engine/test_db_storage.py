# tests/test_models/test_engine/test_db_storage.py

import unittest
from io import StringIO
from unittest.mock import patch
import MySQLdb
from console import HBNBCommand

class TestDBStorage(unittest.TestCase):
    def setUp(self):
        """Set up the test database connection"""
        self.db = MySQLdb.connect(
            user="hbnb_test",
            passwd="hbnb_test_pwd",
            db="hbnb_test_db",
            host="localhost"
        )
        self.cursor = self.db.cursor()

    def tearDown(self):
        """Tear down the test database connection"""
        self.cursor.close()
        self.db.close()

    def count_states(self):
        """Helper function to count the number of states"""
        self.cursor.execute("SELECT COUNT(*) FROM states")
        return self.cursor.fetchone()[0]

    @unittest.skipIf(os.getenv('HBNB_TYPE_STORAGE') != 'db', "Testing DBStorage only")
    def test_create_state(self):
        """Test creating a state via the console"""
        initial_count = self.count_states()

        with patch('sys.stdout', new=StringIO()) as output:
            HBNBCommand().onecmd('create State name="California"')

        final_count = self.count_states()
        self.assertEqual(final_count, initial_count + 1)

if __name__ == "__main__":
    unittest.main()
