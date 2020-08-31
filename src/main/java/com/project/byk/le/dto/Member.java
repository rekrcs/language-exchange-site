package com.project.byk.le.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member {
	private int id;
	private String regDate;
	private String updateDate;
	private String delDate;
	private boolean authStatus;
	private boolean delStatus;
	private String loginId;
	private String loginPw;
	private String name;
	private String nickname;
	private String email;
	private int level;
	private String nativeLang;
	private String practiceLang;
}
