#!/usr/bin/python3
"""This is the user class"""
from sqlalchemy.ext.declarative import declarative_base
from models.base_model import BaseModel, Base
from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from models.place import Place
from models.review import Review


class User(BaseModel, Base):
    """This class defines a user by various attribute"""
    email= ''
    password= ''
    first_name= ''
    last_name= ''
