package com.trism.jesica.persistence.core.entity;

import lombok.EqualsAndHashCode;
import lombok.Getter;

import javax.persistence.MappedSuperclass;

@MappedSuperclass
@Getter
@EqualsAndHashCode(callSuper = true)
public class BaseEntity extends DateEntity {


}
