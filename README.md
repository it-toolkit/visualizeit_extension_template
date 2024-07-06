# Visualize IT Extension Template

This documentation explains how to implement a new extension for VisualizeIT, using the FakeExtension
class as an example

## The Extension
First and foremost, you must define your extension class that inherits from the class **Extension** (from the package *visualizeit_extensions*).
It must have defined an *extensionId* that'll be used to identify it among other extensions and will be used to be referenced in a script.

You must also define a constructor for your Extension. This constructor will receive the docs to be shown as an extension description in **Visualize IT** and an object of a class that extends **Extension Core** (see section [The Core](#the-core))

https://github.com/it-toolkit/visualizeit_extension_template/blob/fb26dd1979bb721ebef88f1086e0096692e01ac2/lib/visualizeit_extension_template.dart#L10-L16

### Define a Builder
You must implement a builder for your extension. The *build* method of this builder will be called when **Visualize IT** starts. 
In this method you should create the extension and pass: 
* a map with the language code of your documentation (i.e. *LanguageCodes.en*) as key and the relative location of the document in your extension as value
* the extension core of your Extension (see section [The Core](#the-core))

https://github.com/it-toolkit/visualizeit_extension_template/blob/fb26dd1979bb721ebef88f1086e0096692e01ac2/lib/visualizeit_extension_template.dart#L16-L32

## The Core
Here you will define some of the most important aspects of the extension. You have to create a class that extends from **SimpleExtensionCore**, with a constructor that will invoke the *super* method with the definition of all your commands (see section [The Commands](#the-commands)). You also have to implement the *render* method that will return the **Widget** that is used to show the visual component of your extension.

https://github.com/it-toolkit/visualizeit_extension_template/blob/fb26dd1979bb721ebef88f1086e0096692e01ac2/lib/visualizeit_extension_template.dart#L32-L68

## The Commands
In order to let the users interact with your extension you must define *commands*, that will be executed to apply changes to your **Model**. These commands will be your instructions when used in a script.
All commands must have a *commandDefinition* that define the name of the command and a list of arguments that the command receives.

### Builder Command
There's one specific type of command, called builder command that you must define. It must extend **ModelBuilderCommand** (from the package *visualizeit_extensions*). This command is intended to be used as an *initializer* for your **Model**. When the *call* method is invoked, it should build everything needed to then be able to process other commands, returning a **Model** to the caller.

https://github.com/it-toolkit/visualizeit_extension_template/blob/fb26dd1979bb721ebef88f1086e0096692e01ac2/lib/visualizeit_extension_template.dart#L68-L80

### Other Commands
You may want to define other commands, to be able to modify the **Model** internal state, that will eventually be rendered in your visualization. These commands must extend **ModelCommand** (from the package *visualizeit_extensions*) and implement the *call* method, and return a **Result** indicating if the command execution is finished, and which is the **Model** associated to that step on the command execution.
When **Visualize IT** is playing a script it will invoke the *call* method of a command until the command returns a **Result** with a ```finished == true```.

```dart
@override
Result call(Model model, CommandContext context) {
  ExternalSortModel externalSortModel = (model.clone()) as ExternalSortModel;
  int pendingFrames;
  Model? resultModel;

  (pendingFrames, resultModel) = externalSortModel.executeCommand(this);
  var result = Result(finished: pendingFrames == 0, model: resultModel);
  return result;
}
```
## The Model
Here you must define the underlying model of your extension. For example, if you are modeling a B# Tree extension, here you will have your tree implementation, so you may execute methods on it, according to the commands that are called over the **Model**. It must extend the **Model** class (from the package *visualizeit_extensions*) and there are no methods to override here, except for a *clone* method, so you can implement how your model process a command execution as you see fit.

https://github.com/it-toolkit/visualizeit_extension_template/blob/fb26dd1979bb721ebef88f1086e0096692e01ac2/lib/visualizeit_extension_template.dart#L80-L90




