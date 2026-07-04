package com.github.duckdin.medtrackapi

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class MedtrackApiApplication

fun main(args: Array<String>) {
	runApplication<MedtrackApiApplication>(*args)
}
