abstract class TodoStates {}

class InitialTodo extends TodoStates {}

class SuccessBottomAppBarState extends TodoStates {}

class SuccessCreateDBState extends TodoStates {}

class SuccessInsertDBState extends TodoStates {}

class SuccessGetDBState extends TodoStates {}

class LoadingGetDBState extends TodoStates {}

class SuccessUpdateDBState extends TodoStates {}

class SuccessDeleteDBState extends TodoStates {}

class ChangeButtonSheetState extends TodoStates {}

class ChangeLanguageToEnglishState extends TodoStates {}

class ChangeLanguageToArabicState extends TodoStates {}

class LoadingChangeLanguageState extends TodoStates {}

class ClearSuccessDataState extends TodoStates{}

class ClearErrorDataState extends TodoStates{}

class ClearLoadingDataState extends TodoStates{}

class TodoChangeAppMode extends TodoStates{}
