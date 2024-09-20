const express = require('express');
const router = express.Router();

router.get('/', async (req, res) => {
    try {
        const result = await req.db.execute(`SELECT * FROM PESQUISA`);
        res.json(result.rows);
    } catch (error) {
        console.error('Erro ao listar as pesquisas:', error);
        res.status(500).json({ message: 'Erro ao listar as pesquisas.' });
    }
});


router.get('/cientistas', async (req, res) => {
    try {
        const result = await req.db.execute(`SELECT ID, NOME FROM CIENTISTA`);
        res.json(result.rows);  // Certifique-se de que "ID" e "NOME" estão sendo retornados
    } catch (error) {
        console.error('Erro ao buscar cientistas:', error);
        res.status(500).json({ error: 'Erro ao buscar cientistas.' });
    }
});



// Rota para listar laboratórios (para preencher o select no formulário)
router.get('/laboratorios', async (req, res) => {
    try {
        const result = await req.db.execute(`SELECT SIGLA, NOME FROM LABORATORIO`);
        res.json(result.rows); // Retornar a lista de laboratórios
    } catch (error) {
        console.error('Erro ao buscar laboratórios:', error);
        res.status(500).json({ message: 'Erro ao buscar laboratórios.' });
    }
});

// Rota para inserir uma nova pesquisa
router.post('/', async (req, res) => {
    const { nome, resultado, qtd_equip, nome_equip, utilidade, consumo_energia, id_cientista, sigla_lab } = req.body;

    console.log("Dados recebidos no backend:", req.body);  // Log para verificar os dados recebidos no backend

    try {
        const query = `
            INSERT INTO PESQUISA (NOME, RESULTADO, QTD_EQUIP, NOME_EQUIP, UTILIDADE, CONSUMO_ENERGIA, ID_CIENTISTA, SIGLA_LAB)
            VALUES (:nome, :resultado, :qtd_equip, :nome_equip, :utilidade, :consumo_energia, :id_cientista, :sigla_lab)
        `;
        console.log("Query SQL:", query);  // Log da query SQL que será executada
        
        await req.db.execute(query, [nome, resultado, qtd_equip, nome_equip, utilidade, consumo_energia, id_cientista, sigla_lab], { autoCommit: true });
        
        res.status(201).json({ message: 'Pesquisa inserida com sucesso!' });
    } catch (error) {
        console.error('Erro ao inserir pesquisa:', error);  // Log do erro detalhado
        res.status(500).json({ message: 'Erro ao inserir pesquisa.', error });
    }
});



// Rota para deletar uma pesquisa pelo nome
router.delete('/:nome', async (req, res) => {
    const nomePesquisa = req.params.nome;  // Obtém o nome da pesquisa a ser deletada

    try {
        const query = `DELETE FROM PESQUISA WHERE NOME = :nome`;
        await req.db.execute(query, [nomePesquisa], { autoCommit: true });
        res.json({ message: `Pesquisa '${nomePesquisa}' deletada com sucesso!` });
    } catch (error) {
        console.error('Erro ao deletar a pesquisa:', error);
        res.status(500).json({ message: 'Erro ao deletar a pesquisa.' });
    }
});

// Rota para atualizar uma pesquisa pelo nome
router.put('/:nome', async (req, res) => {
    const nomePesquisa = req.params.nome;  // Pega o nome da pesquisa da URL
    const { nome, resultado, qtd_equip, nome_equip, utilidade, consumo_energia, id_cientista, sigla_lab } = req.body;

    try {
        const query = `
            UPDATE PESQUISA 
            SET NOME = :nome, RESULTADO = :resultado, QTD_EQUIP = :qtd_equip, NOME_EQUIP = :nome_equip,
                UTILIDADE = :utilidade, CONSUMO_ENERGIA = :consumo_energia, ID_CIENTISTA = :id_cientista, SIGLA_LAB = :sigla_lab
            WHERE NOME = :nomePesquisa
        `;
        await req.db.execute(query, [nome, resultado, qtd_equip, nome_equip, utilidade, consumo_energia, id_cientista, sigla_lab, nomePesquisa], { autoCommit: true });

        res.status(200).json({ message: `Pesquisa '${nome}' atualizada com sucesso!` });
    } catch (error) {
        console.error('Erro ao atualizar a pesquisa:', error);
        res.status(500).json({ message: 'Erro ao atualizar a pesquisa.' });
    }
});







module.exports = router;
