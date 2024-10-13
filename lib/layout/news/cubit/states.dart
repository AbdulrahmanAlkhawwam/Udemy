// the father class
abstract class newsAppStates {}

// the sun classes
class CTState extends newsAppStates {} //  CT = change Theme
class initialState extends newsAppStates {} // initial state
class NBNBState extends newsAppStates {} // NBNB = News Bottom Navigation Bar

////////////////////////////// business classes ///////////////////////////////

class NGBLState extends newsAppStates {} // NL = News Get Business Loading

class NGBSState extends newsAppStates {} // NGBS = News Get Business Success

class NGBEState extends newsAppStates {
  final String error ;
  NGBEState(this.error) ;
} // NGBE = News Get Business Error

//////////////////////////////// sport classes ////////////////////////////////

class NGSpLState extends newsAppStates {} // NGSpL = News Get Sport Loading

class NGSpSState extends newsAppStates {} // NGSpS = News Get Sport Success

class NGSpEState extends newsAppStates {
  final String error ;
  NGSpEState(this.error);
} // NGSpE = News Get Sport Error

/////////////////////////////// science classes ///////////////////////////////

class NGScLState extends newsAppStates {} // NGScL = News Get science Loading

class NGScSState extends newsAppStates {} // NGScS = News Get science Success

class NGScEState extends newsAppStates {
  final String error ;
  NGScEState(this.error);
} // NGScE = News Get science Error

///////////////////////////// technology classes //////////////////////////////

class NGTLState extends newsAppStates {} // NGTL = News Get Technology Loading

class NGTSState extends newsAppStates {} // NGTS = News Get Technology Success

class NGTEState extends newsAppStates {
  final String error ;
  NGTEState(this.error);
} // NGTE = News Get Technology Error

/////////////////////////////// setting classes ///////////////////////////////

class NGSeLState extends newsAppStates {} // NGSeL = News Get search Loading

class NGSeSState extends newsAppStates {} // NGSeS = News Get search Success

class NGSeEState extends newsAppStates {
  final String error ;
  NGSeEState(this.error);
} // NGSeE = News Get search Error
