import random
import smtplib
import ssl
from email.message import EmailMessage
import os
from dotenv import load_dotenv

load_dotenv()

EMAIL_SENDER = os.getenv("EMAIL_SENDER")
EMAIL_PASSWORD = os.getenv("EMAIL_PASSWORD")

def generate_otp():
    return str(random.randint(100000, 999999))

def send_otp_email(user_email, otp_code):
    subject = "Code de vérification de votre adresse e-mail - Style&Home"
    body = f"""
    Bonjour,

    Saisissez ce code sur l'écran de vérification de votre identité : 

    {otp_code}

    ⚠️ Ce code expirera bientôt. Si vous n'avez pas accès à l'écran de vérification, essayez de vous reconnecter.

    Si vous n'avez pas tenté de vous connecter à votre compte Style&Home, nous vous recommandons de réinitialiser immédiatement votre mot de passe.

    Merci pour votre confiance.
    L'équipe Style&Home
    """

    msg = EmailMessage()
    msg['From'] = EMAIL_SENDER
    msg['To'] = user_email
    msg['Subject'] = subject
    msg.set_content(body)

    context = ssl.create_default_context()

    with smtplib.SMTP_SSL('smtp.gmail.com', 465, context=context) as smtp:
        smtp.login(EMAIL_SENDER, EMAIL_PASSWORD)
        smtp.send_message(msg)
