package com.github.duckdin.medtrackapi.entity

import jakarta.persistence.*
import java.time.LocalDateTime
import java.util.UUID

@Entity
@Table(name = "symptom")
data class Symptom(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int = 0,

    @Column(name = "patient_id", nullable = false)
    val patientId: UUID = UUID(0, 0),

    @Column(nullable = false, length = 100)
    val category: String = "",

    @Column(nullable = false)
    val severity: Int = 0,

    @Column(length = 200)
    val notes: String? = null,

    @Column(name = "date_time", nullable = false)
    val dateTime: LocalDateTime = LocalDateTime.now()
)