import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="jandals",
    version="0.0.1",
    author="Jason Pickens",
    author_email="jasonpickensnz@gmail.com",
    description="Bootstraps a new development environment with no prerequisites",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/BotTech/jandals",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: Apache Software License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.7',
)
