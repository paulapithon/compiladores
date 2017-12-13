#ifndef PREAMBULOSEPARATOREXPSSEPARATOR_H
#define PREAMBULOSEPARATOREXPSSEPARATOR_H

#include "preambulo.h"
#include "exps.h"


class PreambuloSeparatorExpsSeparator {
	
	private:
        Preambulo *pream_;
    	Exps *exps_;

	public:
    	PreambuloSeparatorExpsSeparator(Exps *exps, Preambulo *pream) : exps_(exps), pream_(pream) { }
    	virtual ~PreambuloSeparatorExpsSeparator() {
    		delete exps_, pream_;
    	}
    	PreambuloSeparatorExpsSeparator(const PreambuloSeparatorExpsSeparator& s) : exps_(s.exps_), pream_(s.pream_) { }
    	Exps *exps() const { return exps_; }
        Preambulo *preambulo() const { return pream_; }

};

#endif 