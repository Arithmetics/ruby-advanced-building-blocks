module Enumerable


  def my_each
   i = -1
   self.length.times do
     if self[i+1]
       i += 1
       yield(self[i])
     end
   end
   self
  end


  def my_each_with_index
   i = -1
   self.length.times do
     if self[i+1]
       i += 1
       yield(self[i], i)
     end
   end
   self
  end


  def my_select
   i = -1
   selected = []
   self.length.times do
     if self[i+1]
       i += 1
       doit = yield(self[i], i)
       if doit
         selected.push(self[i])
       end
     end
   end
   selected
  end


  def my_all?
   i = -1
   selected = []
   self.length.times do
     if self[i+1]
       i += 1
       doit = yield(self[i], i)
       if doit
         selected.push(self[i])
       end
     end
   end
   if selected.length == self.length
     true
   else
     false
   end
  end


  def my_any?
   i = -1
   selected = []
   self.length.times do
     if self[i+1]
       i += 1
       doit = yield(self[i], i)
       if doit
         selected.push(self[i])
       end
     end
   end
   if selected.length > 0
     true
   else
     false
   end
  end


  def my_none?
   i = -1
   selected = []
   self.length.times do
     if self[i+1]
       i += 1
       doit = yield(self[i], i)
       if doit
         selected.push(self[i])
       end
     end
   end
   if selected.length > 0
     false
   else
     true
   end
  end


  def my_count
   i = -1
   selected = []
   self.length.times do
     if self[i+1]
       i += 1
       doit = yield(self[i], i)
       if doit
         selected.push(self[i])
       end
     end
   end
   return selected.length
  end


  def my_map
   i = -1
   new = []
   self.length.times do
     if self[i+1]
       i += 1
       new.push(yield(self[i]))
     end
   end
   new
  end


  def my_inject(starter=nil)
   if starter
     i = -1
     self.length.times do
       if self[i+1]
         i += 1
         starter = yield(starter, self[i])
       end
     end
   else
     i = 0
     starter = self[0]
     self.length.times do
       if self[i+1]
         i += 1
         starter = yield(starter, self[i])
       end
     end
   end
   starter
  end


  def my_map_with_proc(someProc)
   i = -1
   new = []
   self.length.times do
     if self[i+1]
       i += 1
       new.push(someProc.call(self[i]))
     end
   end
   new
  end


  def my_map_with_optional_proc(someProc=nil)
   i = -1
   new = []
   if someProc
     self.length.times do
       if self[i+1]
         i += 1
         new.push(someProc.call(self[i]))
       end
     end
   else
     self.length.times do
       if self[i+1]
         i += 1
         new.push(yield(self[i]))
       end
     end
   end
   new
  end


end
