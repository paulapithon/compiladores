#ifndef PREAMBULO_H 
#define PREAMBULO_H;

class Preambulo : public ASTNode{

	public:
    	Preambulo() { }
    	virtual ~Preambulo() { }
	
	void accept(Visitor *v) {
		v->visit(this);
	};
    	
}; 

#endif
