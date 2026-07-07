package com.github.duckdin.medtrackapi.controller

import com.github.duckdin.medtrackapi.entity.Symptom
import com.github.duckdin.medtrackapi.repository.SymptomRepository
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/symptoms")
class SymptomController(
    private val symptomRepository: SymptomRepository
) {
    @PostMapping
    fun createSymptom(@RequestBody symptom: Symptom): Symptom {
        return symptomRepository.save(symptom)
    }
}