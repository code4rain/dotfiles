// 사용법
// 이 파일을 프로젝트에서 포함하도록 하고 (project-->add file)
// 이 파일을 열고..
// 커서를 macro egkimMain() 앞에다 놓고...
// .config 파일을 프로젝트 홈 디렉토리에 복사해 놓고
// Run Macro 실행
// 마크로 종료후, project->synchronize files->모든파일 sync

macro egkimMain()
{
	global value;
	global name;
	
	hbuf = openbuf (".config");
	if (hbuf == hNil) {
		msg ("can't open .config");
		stop;
	}

	lines = GetBufLineCount (hbuf);
	lineCurrent = 0;

	while (lineCurrent < lines) {
		string = GetBufLine (hbuf, lineCurrent);
		lineCurrent = lineCurrent +1;
		
		//msg(lineCurrent);
		if (string[0] == "") {
			continue;
		}
		else if (string[0] == "#") {
			egkimParseComment(string);
			continue;
		}
		else {
			egkimParseConfig (string);
		}
	}

	msg ("Success");
	stop;
}

macro egkimParseConfig (str)
{
	length = strlen(str);
	i = 0;

	while (i < length) {
		if (str[i] == "=")
			break;
		i++;
	}

	name = strmid(str, 0, i);
	value = strmid (str, i+1, length);

	if (value == "y" || value=="m")
		value = 1;
	
	addConditionVariable (GetCurrentProj(), name, value);
}

macro egkimParseComment(str)
{
	length = strlen(str);

	if (length <= 3)
		return 0;

	i = 2;
	while (i < length) {
		if (str[i] == " ")
			break;
		i++;
	}

	name = strmid(str, 2, i);

	if (length <= i+1)
		return (0);
		
	value = strmid (str, i+1, length);

	if (value == "is not set") {
		value = 0;
		addConditionVariable (GetCurrentProj(), name, value);
	}
}

