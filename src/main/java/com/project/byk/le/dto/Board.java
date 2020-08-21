package com.project.byk.le.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Board {
	private int id;
	private String regDate;
	private String updateDate;
	private String delDate;
	private boolean displayStatus;
	private boolean delStatus;
	private String code;
	private String name;
}
