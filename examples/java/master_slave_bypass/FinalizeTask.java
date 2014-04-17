/*
 * Copyright (c) 2006-2013. The SimGrid Team.
 * All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the license (GNU LGPL) which comes with this package. 
 */

package master_slave_bypass;
import org.simgrid.msg.Task;

public class FinalizeTask extends Task {    	
   public FinalizeTask() {
      super("finalize",0,0);
   }
}
    