class ScreenData {
  List<Screens>? screens;

  ScreenData({this.screens});

  ScreenData.fromJson(Map<String, dynamic> json) {
    if (json['screens'] != null) {
      screens = <Screens>[];
      json['screens'].forEach((v) {
        screens!.add(Screens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (screens != null) {
      data['screens'] = screens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Screens {
  String? screenName;
  String? heading;
  String? question;
  String? hintText;
  String? fields;
  List<Options>? options;
  String? ans;
  ChildScreen? childScreen;

  Screens(
      {this.screenName,
      this.heading,
      this.question,
      this.hintText,
      this.fields,
      this.options,
      this.ans,
      this.childScreen});

  Screens.fromJson(Map<String, dynamic> json) {
    screenName = json['screen_name'];
    heading = json['heading'];
    question = json['question'];
    hintText = json['hint_text'];
    fields = json['fields'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
    ans = json['ans'];
    childScreen = json['child_screen'] != null
        ? ChildScreen.fromJson(json['child_screen'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['screen_name'] = screenName;
    data['heading'] = heading;
    data['question'] = question;
    data['hint_text'] = hintText;
    data['fields'] = fields;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    data['ans'] = ans;
    if (childScreen != null) {
      data['child_screen'] = childScreen!.toJson();
    }
    return data;
  }
}

class Options {
  String? text;
  String? value;
  String? key;

  Options({this.text, this.value, this.key});

  Options.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['value'] = value;
    data['key'] = key;
    return data;
  }
}

class ChildScreen {
  List<Screens>? frontend;
  List<Screens>? backend;
  List<Screens>? designer;

  ChildScreen({this.frontend, this.backend, this.designer});

  ChildScreen.fromJson(Map<String, dynamic> json) {
    if (json['frontend'] != null) {
      frontend = <Screens>[];
      json['frontend'].forEach((v) {
        frontend!.add(Screens.fromJson(v));
      });
    }
    if (json['backend'] != null) {
      backend = <Screens>[];
      json['backend'].forEach((v) {
        backend!.add(Screens.fromJson(v));
      });
    }
    if (json['designer'] != null) {
      designer = <Screens>[];
      json['designer'].forEach((v) {
        designer!.add(Screens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (frontend != null) {
      data['frontend'] = frontend!.map((v) => v.toJson()).toList();
    }
    if (backend != null) {
      data['backend'] = backend!.map((v) => v.toJson()).toList();
    }
    if (designer != null) {
      data['designer'] = designer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}