"""
패키지 셋업 파일
"""

from setuptools import find_packages, setup

setup(
    name='hello',
    version='1.0.0',
    packages=find_packages(),
    include_package_data=True,
    zip_safe=False,
    install_requires=[
        'astroid==3.1.0',
        'blinker==1.7.0',
        'click==8.1.7',
        'coverage==7.4.4',
        'dill==0.3.8',
        'exceptiongroup==1.2.1',
        'Flask==3.0.2',
        'iniconfig==2.0.0',
        'isort==5.13.2',
        'itsdangerous==2.1.2',
        'Jinja2==3.1.3',
        'MarkupSafe==2.1.5',
        'mccabe==0.7.0',
        'packaging==24.0',
        'platformdirs==4.2.0',
        'pluggy==1.4.0',
        'pylint==3.1.0',
        'pytest==8.1.1',
        'tomli==2.0.1',
        'tomlkit==0.12.4',
        'typing_extensions==4.11.0',
        'Werkzeug==3.0.1'
    ]
)
