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
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rol" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "enabled" BOOLEAN NOT NULL,
    "userId" INTEGER NOT NULL,
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

-- CreateIndex
CREATE UNIQUE INDEX "User.userName_unique" ON "User"("userName");

-- AddForeignKey
ALTER TABLE "Rol" ADD FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AuxiliaryServiceDet" ADD FOREIGN KEY ("auxiliaryServiceId") REFERENCES "AuxiliaryService"("id") ON DELETE CASCADE ON UPDATE CASCADE;
