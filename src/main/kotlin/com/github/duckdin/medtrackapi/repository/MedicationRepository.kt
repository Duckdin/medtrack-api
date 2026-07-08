package com.github.duckdin.medtrackapi.repository

import com.github.duckdin.medtrackapi.entity.Medication
import org.springframework.data.jpa.repository.JpaRepository
import java.util.UUID

interface MedicationRepository : JpaRepository<Medication, Int> {
    fun findByPatientId(patientId: UUID): List<Medication>
}