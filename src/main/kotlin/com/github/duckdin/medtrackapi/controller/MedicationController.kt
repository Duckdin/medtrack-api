package com.github.duckdin.medtrackapi.controller

import com.github.duckdin.medtrackapi.entity.Medication
import com.github.duckdin.medtrackapi.repository.MedicationRepository
import org.springframework.web.bind.annotation.*
import java.util.UUID

@RestController
@RequestMapping("/api/medications")
class MedicationController(
    private val medicationRepository: MedicationRepository
) {
    @PostMapping
    fun createMedication(@RequestBody medication: Medication): Medication {
        return medicationRepository.save(medication)
    }

    @GetMapping("/{patientId}")
    fun getMedicationsForPatient(@PathVariable patientId: UUID): List<Medication> {
        return medicationRepository.findByPatientId(patientId)
    }
}