const LinkedList = () => {

  // This will be interesting with ES6 and function factory structure
  const node = (data, next, previous) => {

    return { data, next, previous }
  }

  let head = new node(null,null,null)
  let tail = new node(null,null,null)
  let count = 0

  const push = (obj) => {
    if (head.data == null) { //first node
      head.data = obj
      head.next = tail
    } else if (tail.data == null){ //second node
      tail.data = obj
      tail.previous = head
    } else {
      let newNode = new node(obj, null, tail)
      tail.next = newNode
      tail = newNode
    }
    count++
  }

  const pop = () => {
    let output = tail.data;
    if (output == null) {
      throw (new Error ("Can not pop an empty list"))
    } else {
      if (tail != head) {
        tail = tail.previous
        tail.next = null
      } else {
        output = head.data
      }
      count--
    }
    return output
  }

  const shift = () => {
    // set head to next node return the node.data that was removed
    // count--
  }

  const unshift = () => {
    // add new node by setting its next node as current head then change head to the new node
    // count++
  }

  return { push, pop, shift, unshift, count }
}

export default LinkedList
