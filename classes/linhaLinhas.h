#ifndef LINHALINHAS_H 
#define LINHALINHAS_H;

#include "linhas.h"
#include "linha.h"

class LinhaLinhas {

	private:
		Linha *linha_;
		Linhas *linhas_;

	public:
		LinhaLinhas(Linha *linha, Linhas *linhas) : linha_(linha), linhas_(linha) { }
		virtual ~LinhaLinhas() {
			delete linha_, linhas_;
		}
    	LinhaLinhas(cont LinhaLinhas& l) : linha_(l.linha_), linhas_(l.linhas) { }
    	Linha *linha() const { return linha_; }
	Linhas *linhas() const { return linhas_; }
	
	void accept(Visitor *v) {
		v->visit(this);
	};

};

#endif
