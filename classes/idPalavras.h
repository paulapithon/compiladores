#ifndef IDPALAVRAS_H 
#define IDPALAVRAS_H

#include "ASTNode.h"
#include "palavras.h"
#include <string>

class IdPalavras : public Palavras {

	private:
		std::string id_;
		Palavras *palavras_;

	public:
	IdPalavras(std::string id, Palavras *palavras) : id_(id), palavras_(palavras) { }
    	virtual ~IdPalavras() {
    		delete palavras_;
    	}

    	IdPalavras(const IdPalavras& p) : id_(p.id_), palavras_(p.palavras_) { }
    	Palavras *palavras() const { return palavras_; }
	
	void accept(Visitor *v);

};

#endif
