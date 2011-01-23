package org.tinytlf.interaction.behaviors
{
	import flash.geom.Point;
	
	import org.tinytlf.util.TinytlfUtil;
	import org.tinytlf.util.fte.TextLineUtil;

	public class RightArrowCtrlBehavior extends RightArrowBehavior
	{
		public function RightArrowCtrlBehavior()
		{
			super();
		}
		
		override protected function getAnchor():Point
		{
			var caret:int = engine.caretIndex - 1;
			var caretAtom:int = TinytlfUtil.globalIndexToAtomIndex(engine, line, caret);
			var newCaret:int = TextLineUtil.getAtomWordBoundary(line, caretAtom, false);
			if(newCaret == caretAtom)
				++newCaret;
			
			return new Point(TinytlfUtil.atomIndexToGlobalIndex(engine, line, newCaret), 0);
		}
	}
}