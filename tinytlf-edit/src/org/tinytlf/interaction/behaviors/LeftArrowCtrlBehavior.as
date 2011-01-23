package org.tinytlf.interaction.behaviors
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import org.tinytlf.util.TinytlfUtil;
	import org.tinytlf.util.fte.TextLineUtil;

	public class LeftArrowCtrlBehavior extends LeftArrowBehavior
	{
		public function LeftArrowCtrlBehavior()
		{
			super();
		}
		
		override protected function getAnchor():Point
		{
			var caret:int = engine.caretIndex;
			var caretAtom:int = TinytlfUtil.globalIndexToAtomIndex(engine, line, caret);
			var newCaret:int = TextLineUtil.getAtomWordBoundary(line, caretAtom);
			return new Point(TinytlfUtil.atomIndexToGlobalIndex(engine, line, newCaret), 0);
		}
	}
}