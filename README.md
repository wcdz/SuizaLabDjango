Comandos a ejecutar

git clone https://github.com/usuario/nombre-del-repositorio.git
cd nombre-del-repositorio

# Crear el entorno virtual
python -m venv env

# Activar el entorno virtual
# En Windows
env\Scripts\activate

# En macOS/Linux
source env/bin/activate

pip install -r requirements.txt

python manage.py migrate

python manage.py runserver

Configuracion Base de datos:

DATABASES = {
    # 'default': {
    #     'ENGINE': 'django.db.backends.sqlite3',
    #     'NAME': BASE_DIR / 'db.sqlite3',
    # }
       'default': {
        'ENGINE': 'django.db.backends.mysql',
        'HOST': 'localhost',
        'PORT': '3306',
        'USER': 'root',
        'PASSWORD': '',
        'NAME': 'suizalab',
        'OPTIONS': {
            'init_command': "SET sql_mode='STRICT_TRANS_TABLES'"
        }
    }
}

Revisar carpeta assets

@wcdz
