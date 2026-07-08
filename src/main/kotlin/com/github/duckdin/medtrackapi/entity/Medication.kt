package com.github.duckdin.medtrackapi.entity

import jakarta.persistence.*
import java.time.LocalTime
import java.util.UUID

@Entity
@Table(name = "medication")
data class Medication(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int = 0,

    @Column(name = "patient_id", nullable = false)
    val patientId: UUID = UUID(0, 0),

    @Column(name = "medication_name", nullable = false, length = 255)
    val medicationName: String = "",

    @Column(nullable = false, length = 100)
    val dosage: String = "",

    @Column(nullable = false, length = 100)
    val frequency: String = "",

    @Column(name = "scheduled_time", nullable = false)
    val scheduledTime: LocalTime = LocalTime.now(),

    @Column(name = "medication_type", nullable = false, length = 100)
    val medicationType: String = "",

    @Column(length = 200)
    val notes: String? = null
)