from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileAllowed
from flask_login import current_user
from wtforms import StringField, PasswordField, SubmitField, BooleanField, TextAreaField
from wtforms.validators import DataRequired, Length, Email, EqualTo, ValidationError
from flaskblog.models import User

class RegistrationForm(FlaskForm):
	username = StringField('Username',
							validators=[DataRequired(),Length(min=2, max=20)])
	email = StringField('Email',
							validators=[DataRequired(),Email()])
	password = PasswordField('Password',
							validators=[DataRequired(),Length(min=6, max=16)])
	confrim_password = PasswordField('Confrim Password',
							validators=[DataRequired(),EqualTo('password')])
	submit = SubmitField('Sign up')

	def validate_username(self, username):
		user = User.query.filter_by(username=username.data).first()
		if user:
			raise ValidationError('That username is already take. Please choose a different one.')

	def validate_email(self, email):
		user = User.query.filter_by(email=email.data).first()
		if user:
			raise ValidationError('That email is already take. Please choose a different one.')


class LoginForm(FlaskForm):
	email = StringField('Email',
						validators=[DataRequired(),Email()])
	password = PasswordField('Password',
						validators=[DataRequired()])
	remember = BooleanField('Remember me')
	submit = SubmitField('Login')

class UpdateAccountForm(FlaskForm):
	username = StringField('Username',
							validators=[DataRequired(),Length(min=2, max=20)])
	email = StringField('Email',
							validators=[DataRequired(),Email()])
	picture = FileField('Update profile picture',
						validators=[FileAllowed(['jpg', 'png'])])

	submit = SubmitField('Update')

	def validate_username(self, username):
		if username.data != current_user.username:
			user = User.query.filter_by(username=username.data).first()
			if user:
				raise ValidationError('That username is already take. Please choose a different one.')

	def validate_email(self, email):
		if email.data != current_user.email:
			user = User.query.filter_by(email=email.data).first()
			if user:
				raise ValidationError('That email is already take. Please choose a different one.')


class PostForm(FlaskForm):
	title = StringField('Title', validators=[DataRequired()])
	content = TextAreaField('Content', validators=[DataRequired()])
	submit = SubmitField('Post')


class CommentForm(FlaskForm):
	comment_text = TextAreaField('Write Comment', validators=[DataRequired()])
	submit = SubmitField('Write Comment')


class FollowersForm(FlaskForm):
	unfollow = SubmitField('Unfollow')
	submit = SubmitField('Follow')