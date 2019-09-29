import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    author="Jason Pickens",
    author_email="jasonpickensnz@gmail.com",
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: Apache Software License",
        "Operating System :: OS Independent",
        "Programming Language :: Python :: 3",
        "Topic :: Software Development",
    ],
    description="Bootstraps a new development environment with no prerequisites",
    entry_points={"console_scripts": ["jandals = jandals.jandals:main"]},
    keywords="bootstrap development-environment developer-tools setup-development-environment setup-tool setuptools setup-macos",
    long_description=long_description,
    long_description_content_type="text/markdown",
    name="jandals",
    packages=setuptools.find_packages(),
    python_requires=">=3",
    url="https://github.com/BotTech/jandals",
    version="0.0.1",
)
