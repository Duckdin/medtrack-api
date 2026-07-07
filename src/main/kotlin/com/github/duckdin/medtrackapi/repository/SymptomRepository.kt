package com.github.duckdin.medtrackapi.repository

import com.github.duckdin.medtrackapi.entity.Symptom
import org.springframework.data.jpa.repository.JpaRepository
import java.util.UUID

interface SymptomRepository : JpaRepository<Symptom, Int> {
    fun findByPatientId(patientId: UUID): List<Symptom>
}