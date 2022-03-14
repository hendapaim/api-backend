-- CreateTable
CREATE TABLE "Aluno" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT,

    CONSTRAINT "Aluno_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Perfil" (
    "id" SERIAL NOT NULL,
    "bio" TEXT,
    "fau" TEXT,
    "year" INTEGER,
    "alunoId" INTEGER NOT NULL,

    CONSTRAINT "Perfil_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cadeira" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "authorId" INTEGER,

    CONSTRAINT "Cadeira_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Materia" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT[],
    "cadeiraId" INTEGER NOT NULL,

    CONSTRAINT "Materia_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Aluno_email_key" ON "Aluno"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Perfil_alunoId_key" ON "Perfil"("alunoId");

-- AddForeignKey
ALTER TABLE "Perfil" ADD CONSTRAINT "Perfil_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "Aluno"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cadeira" ADD CONSTRAINT "Cadeira_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "Aluno"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Materia" ADD CONSTRAINT "Materia_cadeiraId_fkey" FOREIGN KEY ("cadeiraId") REFERENCES "Cadeira"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
