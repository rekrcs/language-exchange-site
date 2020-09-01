package com.project.byk.le.dto;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Article {
	private int id;
	private int memberId;
	private int boardId;
	private String regDate;
	private String updateDate;
	private String delDate;
	private boolean displayStatus;
	private boolean delStatus;
	private String title;
	private String body;
	private String nickname;
	private Map<String, Object> extra;
}
