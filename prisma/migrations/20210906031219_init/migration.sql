-- CreateEnum
CREATE TYPE "Rol" AS ENUM ('JEFE', 'ADMINISTRADOR', 'OPERADOR', 'INFORME');

-- CreateEnum
CREATE TYPE "UnitWork" AS ENUM ('UNIDAD1', 'UNIDAD2', 'PHSM');

-- CreateEnum
CREATE TYPE "Rectifier" AS ENUM ('rectifier1');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "userName" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "password" VARCHAR(25) NOT NULL,
    "enabled" BOOLEAN NOT NULL DEFAULT false,
    "rol" "Rol" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PressureMeter" (
    "id" SERIAL NOT NULL,
    "unitWork" "UnitWork" NOT NULL,
    "measurementDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "forcedPipeline" INTEGER NOT NULL,
    "spiralBox" INTEGER NOT NULL,
    "difusserTube" DOUBLE PRECISION NOT NULL,
    "pressTurboDS" DOUBLE PRECISION NOT NULL,
    "beforeFilter" DOUBLE PRECISION NOT NULL,
    "afterFilter" DOUBLE PRECISION NOT NULL,
    "inBearDSRad" DOUBLE PRECISION NOT NULL,
    "outBearDSRad" DOUBLE PRECISION NOT NULL,
    "waterPressureSeal" DOUBLE PRECISION NOT NULL,
    "WaterFlowSeal" DOUBLE PRECISION NOT NULL,
    "systemPressure" INTEGER NOT NULL,
    "servoMotorPressure" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuxiliaryService" (
    "id" SERIAL NOT NULL,
    "registerDate" TIMESTAMP(3),
    "voltageBar" DOUBLE PRECISION NOT NULL,
    "rectifier" "Rectifier" NOT NULL,
    "unitWork" "UnitWork" NOT NULL,
    "levelBeforeGrill" DOUBLE PRECISION NOT NULL,
    "levelAfterGrill" DOUBLE PRECISION NOT NULL,
    "fisicLevel" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuxiliaryServiceDet" (
    "id" SERIAL NOT NULL,
    "voltageV" DOUBLE PRECISION NOT NULL,
    "voltageA" DOUBLE PRECISION NOT NULL,
    "openingLimiter" DOUBLE PRECISION NOT NULL,
    "activePotency" DOUBLE PRECISION NOT NULL,
    "reactivePotency" DOUBLE PRECISION NOT NULL,
    "auxiliaryServiceId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MaximunMinimunDemand" (
    "id" SERIAL NOT NULL,
    "unitWork" "UnitWork" NOT NULL,
    "registerDate" TIMESTAMP(3) NOT NULL,
    "maximunDemand" DOUBLE PRECISION NOT NULL,
    "maximunDemandHour" SMALLINT NOT NULL,
    "minimunDemand" DOUBLE PRECISION NOT NULL,
    "minimunDemandHour" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CorrectiveMeasure" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TriggerReason" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TriggerStatistics" (
    "id" SERIAL NOT NULL,
    "eventNumber" SMALLINT NOT NULL,
    "eventDate" TIMESTAMP(3) NOT NULL,
    "triggerHour" TIME(6) NOT NULL,
    "normalizationHourLt" TIME(6) NOT NULL,
    "availabilityHourPhsm" TIME(6) NOT NULL,
    "observation" TEXT NOT NULL,
    "potency" DOUBLE PRECISION NOT NULL,
    "leak" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HydraulicMeasumerent" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "measumerentDate" TIMESTAMP(3) NOT NULL,
    "pluviometerHour" TIME(6) NOT NULL,
    "valuePluviometer" DOUBLE PRECISION NOT NULL,
    "reservoirLevelHour" TIME(6) NOT NULL,
    "reservoirLevelValue" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EventType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OperationMode" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TemperatureMeter" (
    "id" SERIAL NOT NULL,
    "unitWork" "UnitWork" NOT NULL,
    "meterHour" TIME(6) NOT NULL,
    "phaseR" SMALLINT NOT NULL,
    "phaseS" SMALLINT NOT NULL,
    "phaseT" SMALLINT NOT NULL,
    "statorU" SMALLINT NOT NULL,
    "statorV" SMALLINT NOT NULL,
    "statorW" SMALLINT NOT NULL,
    "bearDSRad" SMALLINT NOT NULL,
    "bearNDSRad" SMALLINT NOT NULL,
    "bearNDSAx" SMALLINT NOT NULL,
    "hotAir" SMALLINT NOT NULL,
    "regulatorOilTank" SMALLINT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Report" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "fileName" TEXT NOT NULL,
    "dataSource" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HydrologicalBalance" (
    "id" SERIAL NOT NULL,
    "energySentWh" BIGINT NOT NULL,
    "energySentMwh" DOUBLE PRECISION NOT NULL,
    "energyReceivedWh" BIGINT NOT NULL,
    "energyReceivedKwh" DOUBLE PRECISION NOT NULL,
    "initialLevelMsnm" DOUBLE PRECISION NOT NULL,
    "initialVolUtilMiles" DOUBLE PRECISION NOT NULL,
    "reservoirFlowContribution" DOUBLE PRECISION NOT NULL,
    "reservoirSupplyVolumeMiles" DOUBLE PRECISION NOT NULL,
    "ecologicalExtractionReservoir" DOUBLE PRECISION NOT NULL,
    "turbinatedExtractionReservoir" DOUBLE PRECISION NOT NULL,
    "leakExtractionReservoir" DOUBLE PRECISION NOT NULL,
    "ecologicalExtractionReservoirMiles" DOUBLE PRECISION NOT NULL,
    "turbinatedExtractionReservoirMiles" DOUBLE PRECISION NOT NULL,
    "leakExtractionReservoirMiles" DOUBLE PRECISION NOT NULL,
    "finalLevelMsnm" DOUBLE PRECISION NOT NULL,
    "finalVolumeUtilMiles" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MeterLecture" (
    "id" SERIAL NOT NULL,
    "lectureDate" TIMESTAMP(3) NOT NULL,
    "bruteU1" SMALLINT NOT NULL,
    "barU1" DOUBLE PRECISION NOT NULL,
    "bruteU2" SMALLINT NOT NULL,
    "barU2" DOUBLE PRECISION NOT NULL,
    "ltSent" DOUBLE PRECISION NOT NULL,
    "ltReceived" DOUBLE PRECISION NOT NULL,
    "hydrologicalBalanceId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkedHour" (
    "id" SERIAL NOT NULL,
    "unitWork" "UnitWork" NOT NULL,
    "workedDate" TIMESTAMP(3) NOT NULL,
    "entryHour" TIME(6) NOT NULL,
    "exitHour" TIME(6),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Event" (
    "id" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "eventTypeId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FailureTechniqueType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TypeMeasureCorrective" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Failure" (
    "id" SERIAL NOT NULL,
    "failureTechniqueTypeId" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "activePotency" DOUBLE PRECISION NOT NULL,
    "reactivePotency" DOUBLE PRECISION NOT NULL,
    "correctiveMeasure" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User.userName_unique" ON "User"("userName");

-- AddForeignKey
ALTER TABLE "AuxiliaryServiceDet" ADD FOREIGN KEY ("auxiliaryServiceId") REFERENCES "AuxiliaryService"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MeterLecture" ADD FOREIGN KEY ("hydrologicalBalanceId") REFERENCES "HydrologicalBalance"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Event" ADD FOREIGN KEY ("id") REFERENCES "WorkedHour"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Event" ADD FOREIGN KEY ("eventTypeId") REFERENCES "EventType"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Failure" ADD FOREIGN KEY ("failureTechniqueTypeId") REFERENCES "FailureTechniqueType"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Failure" ADD FOREIGN KEY ("id") REFERENCES "Event"("id") ON DELETE CASCADE ON UPDATE CASCADE;
