package com.github.duckdin.medtrackapi.repository

import com.github.duckdin.medtrackapi.entity.Symptom
import org.springframework.data.jpa.repository.JpaRepository

interface SymptomRepository : JpaRepository<Symptom, Int>