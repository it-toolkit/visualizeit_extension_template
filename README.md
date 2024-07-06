# Visualize IT Extension Template

This documentation explains how to implement a new extension for VisualizeIT, using the FakeExtension
class as an example

## The Extension
First and foremost, you must define your extension class that inherits from the class **Extension**.
It must have defined an * *extensionId* * that'll be used to identify it among other extensions and will be used to be referenced in a script.

You must also define a constructor for your Extension. This constructor will receive the docs to be shown as an extension description in **Visualize IT** and an object of a class that extends **Extension Core** (see section XXX)

https://github.com/it-toolkit/visualizeit_extension_template/blob/fb26dd1979bb721ebef88f1086e0096692e01ac2/lib/visualizeit_extension_template.dart#L11-L15

### Define a Builder
You must implement a builder for your extension. The * *build* * method of this builder will be called when **Visualize IT** starts. 
In this method you should create the extension and pass: 
* a map with the language code of your documentation (i.e. * * LanguageCodes.en* *) as key and the relative location of the document in your extension as value
* the extension core of your Extension (see section XXX)

https://github.com/it-toolkit/visualizeit_extension_template/blob/fb26dd1979bb721ebef88f1086e0096692e01ac2/lib/visualizeit_extension_template.dart#L17-L31

