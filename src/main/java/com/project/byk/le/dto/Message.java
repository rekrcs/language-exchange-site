package com.project.byk.le.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Message {
	private int id;
	private int fromMemberId;
	private int toMemberId;
	private String regDate;
	private String delDate;
	private String displayStatus;
	private String delStatus;
	private String message;
}
